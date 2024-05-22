/*
 * -----------------------------------------------------------------
 * Copyright (C) 2018-2028, by Victor, All rights reserved.
 * -----------------------------------------------------------------
 * File: Signal
 * Author: Victor
 * Date: 2024/05/13 11:59
 * Description: 
 * -----------------------------------------------------------------
 */
import { OptWaves } from './OptWaves'

import uri from '@ohos.uri'

export class Signal {
  uri: uri.URI
  queries: OptWaves

  constructor(
    uri: uri.URI,
    queries: OptWaves
  ) {
  this.uri = uri
  this.queries = queries
  }
}