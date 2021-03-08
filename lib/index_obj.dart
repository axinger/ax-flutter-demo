//
//  index_obj
//  ax_flutter_demo
//
//  Created by 刘伟星 on 2020/8/17 11:59 下午 .
//  Copyright ©2020/8/17 ax_flutter_demo. All rights reserved.
//

extension SafeObject<E> on Object {
  E? safeElementAt(index) {
    if (this.runtimeType == List) {
      if ((this as List).length > index) {
        return (this as List).elementAt(index);
      }
      return null;
    }

    return null;
  }
}
