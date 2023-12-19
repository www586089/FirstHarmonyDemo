import window from '@ohos.window';
import display from '@ohos.display';

export class WindowManager {
  private windowStage?: window.WindowStage;
  private subWindow?: window.Window;

  private static instance: WindowManager = null

  /**
   * Get singleton.
   *
   * @return {WindowModel} WindowModel
   */
  static getInstance(): WindowManager {
    if (null === WindowManager.instance) {
      WindowManager.instance = new WindowManager();
    }
    return WindowManager.instance;
  }

  /**
   * Set windowStage.
   *
   * @param windowStage The object of WindowStage.
   */
  setWindowStage(windowStage: window.WindowStage) {
    this.windowStage = windowStage;
  }

  /**
   * Create sub window.
   */
  createSubWindow() {
    if (this.windowStage === undefined) {
      console.error('Failed to create the subWindow.');
      return;
    }
    this.windowStage.createSubWindow('subWindow', (err, data: window.Window) => {
      if (err.code) {
        console.error(`Failed to create the window. Code:${err.code}, message:${err.message}`);
        return;
      }
      // Obtains a child window instance.
      this.subWindow = data;
      // Obtains the screen width and height.
      let screenWidth = display.getDefaultDisplaySync().width;
      let screenHeight = display.getDefaultDisplaySync().height;
      // Calculate the sub-window width and height based on the sub-window aspect ratio.
      let windowWidth = screenWidth * 0.85;
      let windowHeight = windowWidth / 1.5;
      // Calculate the start coordinate of the sub-window.
      let moveX = (screenWidth - windowWidth) / 2;
      let moveY = screenHeight - windowHeight;
      this.subWindow.moveWindowTo(moveX, moveY, (err) => {
        if (err.code) {
          console.error(`Failed to move the window. Code:${err.code}, message:${err.message}`);
          return;
        }
      });
      this.subWindow.resize(windowWidth, windowHeight, (err) => {
        if (err.code) {
          console.error(`Failed to change the window size. Code:${err.code}, message:${err.message}`);
          return;
        }
      });
      this.subWindow.setUIContent('pages/window/VerifySmsPage', (err) => {
        if (err.code) {
          console.error(`Failed to load the content. Code:${err.code}, message:${err.message}`);
          return;
        }
        if (this.subWindow === undefined) {
          console.error('subWindowClass is undefined.');
          return;
        }
        this.subWindow.setWindowBackgroundColor('#00000000');
        this.subWindow.showWindow((err) => {
          if (err.code) {
            console.error(`Failed to show the window. Code:${err.code}, essage:${err.message}`);
            return;
          }
        });
      });
    });
  }

  /**
   * Set the main window immersive.
   */
  setMainWindowImmersive() {
    if (this.windowStage === undefined) {
      console.error('windowStage is undefined.');
      return;
    }
    this.windowStage.getMainWindow((err, windowClass: window.Window) => {
      if (err.code) {
        console.error(`Failed to obtain the main window. Code:${err.code}, message:${err.message}`);
        return;
      }
      windowClass.setWindowLayoutFullScreen(true, (err) => {
        if (err.code) {
          console.error(`Failed to set full-screen mode. Code:${err.code}, message:${err.message}`);
          return;
        }
      });
      windowClass.setWindowSystemBarEnable([], (err) => {
        if (err.code) {
          console.error(`Failed to set the system bar to be invisible. Code:${err.code}, message:${err.message}`);
          return;
        }
      });
    });
  }

  /**
   * Destroy sub window.
   */
  destroySubWindow() {
    if (this.subWindow == null) {
      console.error('subWindowClass is undefined.');
      return;
    }
    this.subWindow.destroyWindow((err) => {
      if (err.code) {
        console.error(`Failed to destroy the window. Code:${err.code}, message:${err.message}`);
        return;
      }
    });
  }
}