
import { RouterPath } from "lib_neuro_router_core/src/main/ets/util/RouterPath";

export function harInit(path: string): void{
  // 动态引入要跳转的页面
  switch (path) {
    case RouterPath.ME_MAIN_PAGE:
      import("./src/main/ets/components/mainpage/MainPage");
      break;
    default:
      break;
  }
}