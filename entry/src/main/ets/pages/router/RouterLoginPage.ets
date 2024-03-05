import router from '@ohos.router';
import promptAction from '@ohos.promptAction';
import base from '@ohos.base';

@Entry
@Component
struct RouterLoginPage {
  @State message: string = '演示登录跳转'

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Button('登录').padding({left: 32, right: 32, top: 8, bottom: 8}).onClick(() => {
          router.replaceUrl({url: "pages/router/RouterMinePage"}, router.RouterMode.Standard, (err) => {
            if (err) {
              console.error(`Invoke pushUrl failed, code is ${err.code}, message is ${err.message}`);
              return;
            }
            console.info('Invoke pushUrl succeeded.');
          })
        })
        Button('返回测试').padding({left: 32, right: 32, top: 8, bottom: 8}).margin({top: 24}).onClick(() => {
          onBackClickV2()
        })
      }
      .width('100%')
    }
    .height('100%')
  }

  aboutToDisappear() {
    console.info("Router Login Page finish")
  }
}

// 定义一个返回按钮的点击事件处理函数
function onBackClick(): void {
  // 调用router.showAlertBeforeBackPage()方法，设置返回询问框的信息
  try {
    router.showAlertBeforeBackPage({
      message: '您还没有完成支付，确定要返回吗？' // 设置询问框的内容
    });
  } catch (err) {
    console.error(`Invoke showAlertBeforeBackPage failed, code is ${err.code}, message is ${err.message}`);
  }

  // 调用router.back()方法，返回上一个页面
  router.back();
}

function onBackClickV2() {
  // 弹出自定义的询问框
  promptAction.showDialog({
    message: '您还没有完成支付，确定要返回吗？',
    buttons: [
      {
        text: '取消',
        color: '#FF0000'
      },
      {
        text: '确认',
        color: '#0099FF'
      }
    ]
  }).then((result) => {
    if (result.index === 0) {
      // 用户点击了“取消”按钮
      console.info('User canceled the operation.');
    } else if (result.index === 1) {
      // 用户点击了“确认”按钮
      console.info('User confirmed the operation.');
      // 调用router.back()方法，返回上一个页面
      router.back();
    }
  }).catch((err: base.BusinessError) => {
    console.error(`Invoke showDialog failed, code is ${err.code}, message is ${err.message}`);
  })
}