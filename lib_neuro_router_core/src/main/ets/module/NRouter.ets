/*
 * -----------------------------------------------------------------
 * Copyright (C) 2018-2028, by Victor, All rights reserved.
 * -----------------------------------------------------------------
 * File: NRouter
 * Author: Victor
 * Date: 2024/05/11 11:15
 * Description:
 * -----------------------------------------------------------------
 */
import { logger } from '../util/Logger';

const TAG: string = 'NRouter';

export class NRouter {
  static builderMap: Map<string, WrappedBuilder<[object]>> = new Map<string, WrappedBuilder<[object]>>();
  static navPathStack: NavPathStack = new NavPathStack();

  // 通过名称注册builder
  public static registerBuilder(builderName: string, builder: WrappedBuilder<[object]>): void {
    NRouter.builderMap.set(builderName, builder);
  }

  // 通过名称获取builder
  public static getBuilder(builderName: string): WrappedBuilder<[object]> {
    let builder = NRouter.builderMap.get(builderName);
    return builder as WrappedBuilder<[object]>;
  }

  // 通过名称获取router
  private static getNavPathStack(): NavPathStack {
    return NRouter.navPathStack;
  }

  // 通过获取页面栈跳转到指定页面
  public static async push(path: string, param?: string): Promise<void> {
    logger.error(TAG, `path = ${path}`);
    logger.error(TAG, `param = ${param}`);
    // 分解url
    // 获取包名、路由名、页面名
    let params = path.split("/");
    if (params.length < 2) {
      logger.error(TAG, 'nav error url parms not enough');
      return
    }
    const moduleName = params[0];
    const pageName = params[1];

    logger.error(TAG, `moduleName = ${moduleName}`);
    logger.error(TAG, `pageName = ${pageName}`);

    // 动态加载模块是否成功
    let isImportSucceed: boolean = false;
    await import(moduleName).then((result: ESObject) => {
      // 动态加载模块成功时，通过模块中的harInit接口加载页面
      result.harInit(path);
      isImportSucceed = true;
    }, (error: ESObject) => {
      // 动态加载模块失败时，打印错误日志
      logger.error(TAG, `Dynamics import failed-error = ${error}`);
    });
    if (isImportSucceed) {
      NRouter.getNavPathStack().pushPathByName(path, param);
    }
  }

  // 通过获取页面栈并pop
  public static pop(): void {
    // 查找到对应的路由栈进行pop
    NRouter.getNavPathStack().pop();
  }

  // 通过获取页面栈并将其清空
  public static clear(routerName: string): void {
    // 查找到对应的路由栈进行pop
    NRouter.getNavPathStack().clear();
  }

  /**
   * 注册动态路由需要加载的页面
   *
   * @param pageName 页面名，需要动态加载的页面名称
   * @param wrapBuilder wrapBuilder对象
   */
  public static registerRouterPage(builderName: string, wrapBuilder: WrappedBuilder<[object]>): void {
    if (!NRouter.getBuilder(builderName)) {
      NRouter.registerBuilder(builderName, wrapBuilder);
    }
  }

}