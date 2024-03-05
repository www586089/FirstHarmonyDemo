import UIAbility from '@ohos.app.ability.UIAbility';
import hilog from '@ohos.hilog';
import window from '@ohos.window';
import { Constant } from '../utils/Constant';
import { WindowManager } from '../window/WindowManger';
import { AbilityConstant, Want } from '@kit.AbilityKit';

export default class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam) {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');
  }

  onDestroy() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onDestroy');
  }


  onWindowStageCreate(windowStage: window.WindowStage) {
    WindowManager.getInstance().setWindowStage(windowStage)
    // 1.获取应用主窗口。
    let window: window.Window;
    windowStage.getMainWindow((err, data) => {
      if (err.code) {
        console.error('Failed to obtain the main window. Cause: ' + JSON.stringify(err));
        return;
      }
      window = data;
      console.info('Succeeded in obtaining the main window. Data: ' + JSON.stringify(data));
      /**
       * 2. 实现沉浸式效果：设置导航栏、状态栏不显示。
       */
      window.setWindowLayoutFullScreen(true, (err) => {
        if (err.code) {
          console.error(`Failed to set the window layout to full-screen mode. Cause: ${JSON.stringify(err)}`);
          return;
        }
        console.info('Succeeded in setting the window layout to full-screen mode.');
      });
      let sysBarProps = {
        statusBarColor: Constant.TRANSPARENT_COLOR,
        navigationBarColor: Constant.NAVIGATION_BAR_COLOR,
        statusBarContentColor: Constant.STATUS_BAR_CONTENT_COLOR,
        navigationBarContentColor: Constant.NAVIGATION_BAR_CONTENT_COLOR
      } as window.SystemBarProperties;
      window.setWindowSystemBarProperties(sysBarProps, (err) => {
        if (err.code) {
          console.error(`Failed to set the system bar properties. Cause: ${JSON.stringify(err)}`)
          return;
        }
        console.info('Succeeded in setting the system bar properties.')
      });
    }
    )
    // 3.为主窗口加载对应的目标页面。
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');

    windowStage.loadContent('pages/Index', (err, data) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content. Data: %{public}s', JSON.stringify(data) ?? '');
    });
  }

  onWindowStageDestroy() {
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground() {
    // Ability has brought to foreground
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground');
  }

  onBackground() {
    // Ability has back to background
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
  }
}
