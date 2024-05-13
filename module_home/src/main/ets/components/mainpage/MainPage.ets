
import { NRouter } from "lib_neuro_router_core/src/main/ets/module/NRouter";
import { RouterPath } from "lib_neuro_router_core/src/main/ets/util/RouterPath";

@Component
export struct MainPage {
  build() {
    NavDestination() {
      Row() {
        Column() {
          Text('module_home-MainPage')
            .fontSize(28)
            .fontWeight(FontWeight.Bold)
            .fontColor(Color.Black)
        }
        .width('100%')
      }
      .height('100%')
      .backgroundColor(Color.Blue)
    }
    .title("module_home_MainPage")
    .onBackPressed(() => {
      NRouter.pop();
      return true;
    })
  }
}

// 创建WrappedBuilder对象，动态路由跳转时构建页面
@Builder
export function getPage(): void {
  MainPage();
}

NRouter.registerBuilder(RouterPath.HOME_MAIN_PAGE, wrapBuilder(getPage));