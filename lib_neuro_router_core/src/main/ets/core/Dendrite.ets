/*
 * -----------------------------------------------------------------
 * Copyright (C) 2018-2028, by Victor, All rights reserved.
 * -----------------------------------------------------------------
 * File: Dendrite
 * Author: Victor
 * Date: 2024/05/13 12:03
 * Description: 
 * -----------------------------------------------------------------
 */
import { Signal } from './Signal'
import { HashMap } from '@kit.ArkTS'

export class Dendrite {

  signals = new HashMap<String,Signal>()

  private static instance: Dendrite;

  private constructor() {
    // 私有构造函数，防止外部实例化
  }

  public static getInstance(): Dendrite {
    if (!Dendrite.instance) {
      Dendrite.instance = new Dendrite();
    }
    return Dendrite.instance;
  }

}