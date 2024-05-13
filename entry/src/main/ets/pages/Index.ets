
import { NRouter } from "lib_neuro_router_core/src/main/ets/module/NRouter";
import { RouterPath } from "lib_neuro_router_core/src/main/ets/util/RouterPath";

@Entry
@Component
struct Index {
  @State message: string = '神经网络路由-你的组件化从这里开始';


  aboutToAppear(): void {
  }

  @Builder
  routerMap(builderName: string, param: object) {
    NRouter.getBuilder(builderName).builder(param);
  };

  build() {
    Navigation(NRouter.navPathStack) {
      Column() {
        Text('to home home page')
          .width('100%')
          .backgroundColor(Color.Yellow)
          .height(100)
          .fontSize(28)
          .fontWeight(FontWeight.Bold)
          .onClick(() => {
            NRouter.push(RouterPath.HOME_HOME_PAGE);
          })

        Text('to home main page')
          .width('100%')
          .height(100)
          .backgroundColor(Color.Blue)
          .margin({top: 30})
          .fontSize(28)
          .fontWeight(FontWeight.Bold)
          .onClick(() => {
            NRouter.push(RouterPath.HOME_MAIN_PAGE);
          })

        Text('to me main page')
          .width('100%')
          .height(100)
          .backgroundColor(Color.Pink)
          .margin({top: 30})
          .fontSize(28)
          .fontWeight(FontWeight.Bold)
          .onClick(() => {
            NRouter.push(RouterPath.ME_MAIN_PAGE);
          })
      }
      .height('100%')
    }
    .title('NeuroRouter')
    .navDestination(this.routerMap);

  }
}