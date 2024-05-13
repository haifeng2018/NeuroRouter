
import { NRouter } from "lib_neuro_router_core/src/main/ets/module/NRouter";
import { RouterPath } from "lib_neuro_router_core/src/main/ets/util/RouterPath";

@Component
export struct HomePage {
  build() {
    NavDestination() {
      Row() {
        Column() {
          Text('module_home-HomePage')
            .fontSize(28)
            .fontWeight(FontWeight.Bold)
            .fontColor(Color.Black)
            .onClick(() => {
              NRouter.push(RouterPath.ME_MAIN_PAGE);
            })
        }
        .width('100%')
      }
      .height('100%')
      .backgroundColor(Color.Yellow)
    }
    .title("module_home_HomePage")
    .onBackPressed(() => {
      NRouter.pop();
      return true;
    })
  }
}

// 创建WrappedBuilder对象，动态路由跳转时构建页面
@Builder
export function getPage(): void {
  HomePage();
}

NRouter.registerBuilder(RouterPath.HOME_HOME_PAGE, wrapBuilder(getPage));