/*
 * -----------------------------------------------------------------
 * Copyright (C) 2018-2028, by Victor, All rights reserved.
 * -----------------------------------------------------------------
 * File: Chosen
 * Author: Victor
 * Date: 2024/05/13 12:13
 * Description: 
 * -----------------------------------------------------------------
 */
import { Nucleus } from './Nucleus'

export class Chosen {
  nucleus: Nucleus;
  scheme: string;
  host: string;
  port: number;

  constructor(
    nucleus: Nucleus,
    scheme: string,
    host: string,
    port: number,
  ) {
    this.nucleus = nucleus
    this.scheme = scheme
    this.host = host
    this.port = port
  }
}