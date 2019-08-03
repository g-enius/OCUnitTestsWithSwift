import UIKit
import RxSwift
import RxRelay

let relay = BehaviorRelay<Int>(value: 0)

let single: Single<Int> = relay
    .map { (int: Int) -> Int in
        return int + 1
    }
    .debug("before")
    .asSingle()
    .debug("after")

single.subscribe(onSuccess: { int in
    print(int)
}) { error in
    print(error)
}
