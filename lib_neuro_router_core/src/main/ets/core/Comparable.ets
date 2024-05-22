/*
 * -----------------------------------------------------------------
 * Copyright (C) 2018-2028, by Victor, All rights reserved.
 * -----------------------------------------------------------------
 * File: Comparable
 * Author: Victor
 * Date: 2024/05/13 15:08
 * Description: 
 * -----------------------------------------------------------------
 */

export interface  Comparable<T> {
  compareTo(other: T): number
}