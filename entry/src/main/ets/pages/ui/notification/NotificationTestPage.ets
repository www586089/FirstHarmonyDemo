import NotificationManager from '@ohos.notificationManager';
import image from '@ohos.multimedia.image';
import wantAgent from '@ohos.wantAgent';

@Extend(Text)
function fancy(fontWeight: FontWeight, fontSize: number) {
  .fontWeight(fontWeight)
  .fontSize(fontSize)
}

@Entry
@Component
struct NotificationTestPage {
  @Styles
  cuteButton() {
    .margin({
      top: 20
    })
    .backgroundColor("#0D9FFB")
    .width('40%')
    .height('5%')
  }



  itemList: object[] = [
    { info: '普通文本类型通知', action: (() => {
      this.normalNotification()
    }) },
    { info: '长文本类型通知', action: (() => {
      this.longTextNotification()
    }) },
    { info: '多行文本类型通知', action: (() => {
      this.multilineTextNotification()
    }) },
    { info: '图片类型通知', action: (() => {
      this.pictureNotification()
    }) },
    { info: '进度条类型通知', action: (() => {
      this.progressNotification()
    }) },
    { info: '为通知添加意图', action: (() => {
      this.wantAgentInfo()
    }) },
  ]


  wantAgentInfo() {
    //todo
    let wantAgentObj = null; // 用于保存创建成功的WantAgent对象，后续使用其完成触发的动作。

    // 1. wantAgentInfo
    let wantAgentInfo = {
      wants: [
        {
          action: 'event_name', // 设置事件名。
          parameters: {},
        }
      ],
      operationType: wantAgent.OperationType.SEND_COMMON_EVENT,
      requestCode: 0,
      wantAgentFlags: [wantAgent.WantAgentFlags.CONSTANT_FLAG],
    }

    // 2. 创建WantAgent
    wantAgent.getWantAgent(wantAgentInfo, (err, data) => {
      if (err) {
        console.error('[WantAgent]getWantAgent err=' + JSON.stringify(err));
      } else {
        console.info('[WantAgent]getWantAgent success');
        wantAgentObj = data;
      }
    });

    // 3. 构造NotificationRequest对象
    let notificationRequest = {
      content: {
        contentType: NotificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
        normal: {
          title: 'Test_Title',
          text: 'Test_Text',
          additionalText: 'Test_AdditionalText',
        },
      },
      id: 1,
      label: 'TEST',
      wantAgent: wantAgentObj,
    }

    // 4. 通知发送
    NotificationManager.publish(notificationRequest, (err) => {
      if (err) {
        console.error(`[ANS] failed to publish, error[${err}]`);
        return;
      }
      console.info(`[ANS] publish success `);
    });
  }


  progressNotification() {
    NotificationManager.isSupportTemplate('downloadTemplate').then((data) => {
      console.info(`[ANS] isSupportTemplate success`);
      let isSupportTpl: boolean = data; // isSupportTpl的值为true表示支持支持downloadTemplate模板类通知，false表示不支持
      if (isSupportTpl) {
        this.doShowProgressNotification()
      } else {
        console.error(`Not support progress type notification!!!!`)
      }
    }).catch((err) => {
      console.error(`[ANS] isSupportTemplate failed, error[${err}]`);
    });
  }

  doShowProgressNotification() {
    let template = {
      name:'downloadTemplate',
      data: {
        title: '标题：',
        fileName: 'music.mp4',
        progressValue: 30,
        progressMaxValue:100,
      }
    }
    //构造NotificationRequest对象
    let notificationRequest = {
      id: 1,
      slotType: NotificationManager.SlotType.OTHER_TYPES,
      template: template,
      content: {
        contentType: NotificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
        normal: {
          title: template.data.title + template.data.fileName,
          text: "sendTemplate",
          additionalText: "30%"
        }
      },
      deliveryTime: new Date().getTime(),
      showDeliveryTime: true
    }
    NotificationManager.publish(notificationRequest).then(() => {
      console.info(`[ANS] publish success `);
    }).catch((err) => {
      console.error(`[ANS] failed to publish, error[${err}]`);
    });
  }

  async pictureNotification() {
    // 图片构造
    const color = new ArrayBuffer(60000);
    let bufferArr = new Uint8Array(color);
    for (var i = 0; i < bufferArr.byteLength; i++) {
      bufferArr[i++] = 20;
      bufferArr[i++] = 220;
      bufferArr[i++] = 100;
      bufferArr[i] = 60;
    }
    let opts = { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 100, width: 150 } };
    await image
      .createPixelMap(color, opts)
      .then(async (pixelMap) => {
        await pixelMap.getImageInfo().then(imageInfo => {
          console.log("=====size: ====" + JSON.stringify(imageInfo.size));
        }).catch(err => {
          console.error("Failed to obtain the image pixel map information." + JSON.stringify(err));
          return;
        })
        let notificationRequest = {
          id: 1,
          content: {
            contentType: NotificationManager.ContentType.NOTIFICATION_CONTENT_PICTURE,
            picture: {
              title: 'test_title',
              text: 'test_text',
              additionalText: 'test_additionalText',
              picture: pixelMap,
              briefText: 'test_briefText',
              expandedTitle: 'test_expandedTitle',
            }
          },
        }
        // 发送通知
        NotificationManager.publish(notificationRequest, (err) => {
          if (err) {
            console.error(`[ANS] failed to publish, error[${err}]`);
            return;
          }
          console.info(`[ANS] publish success `);
        });
      }).catch(err => {
        console.error('create pixelmap failed ==========' + JSON.stringify(err));
        return;
      })
  }

  multilineTextNotification() {
    let notificationRequest = {
      id: 1,
      content: {
        contentType: NotificationManager.ContentType.NOTIFICATION_CONTENT_MULTILINE, // 多行文本类型通知
        multiLine: {
          title: 'test_title',
          text: 'test_text',
          briefText: 'test_briefText',
          longTitle: 'test_longTitle',
          lines: ['line_01', 'line_02', 'line_03', 'line_04'],
        }
      }
    }

    // 发布通知
    NotificationManager.publish(notificationRequest, (err) => {
      if (err) {
        console.error(`[ANS] failed to publish, error[${err}]`);
        return;
      }
      console.info(`[ANS] publish success`);
    });
  }

  longTextNotification() {
    let notificationRequest = {
      id: 1,
      content: {
        contentType: NotificationManager.ContentType.NOTIFICATION_CONTENT_LONG_TEXT, // 长文本类型通知
        longText: {
          title: '标题测试',
          text: '标题文本测试',
          additionalText: 'test_additionalText',
          longText: '这里测试一个很长很长很长的问题，看是如何显示在通知栏上的',
          briefText: 'test_briefText',
          expandedTitle: '这个是通知展开时的一个长长长的标题，看在通知栏展开时如何展示',
        }
      }
    }

    // 发布通知
    NotificationManager.publish(notificationRequest, (err) => {
      if (err) {
        console.error(`[ANS] failed to publish, error[${err}]`);
        return;
      }
      console.info(`[ANS] publish success`);
    });
  }

  normalNotification() {
    let notificationRequest = {
      id: 1,
      content: {
        contentType: NotificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT, // 普通文本类型通知
        normal: {
          title: 'test_title',
          text: 'test_text',
          additionalText: 'test_additionalText',
        }
      }
    }

    NotificationManager.publish(notificationRequest, (err) => {
      if (err) {
        console.error(`[ANS] failed to publish, error[${err}]`);
        return;
      }
      console.info(`[ANS] publish success`);
    });
  }

  build() {
    List() {
      ForEach(this.itemList, (item) => {
        ListItem() {
          FancyButton({ info: item.info, action: (() => {
            item.action.call()
          }) })
        }
      }, item => item.info)
    }.alignListItem(ListItemAlign.Center)
    .height('100%').width('100%')
  }
}

@Component
struct FancyButton {
  info: string = "";
  action: (event?: ClickEvent) => void;

  @Styles
  cuteButton() {
    .margin({
      top: 20
    })
    .backgroundColor("#0D9FFB")
    .width('45%')
    .height('5%')
  }

  build() {

    Button() {
      Text(this.info).fancy(FontWeight.Normal, 20)
    }.cuteButton().type(ButtonType.Capsule).onClick(() => {
      {
        this.action.call(this)
      }
    })
  }
}