import { EventEmitter } from '../../util/eventEmitter';
import Dispatcher from '../../util/dispatcher';
interface BaseStoreEvents<STATE> {
    updated: (newState: STATE, prevState?: STATE) => void;
}
export default abstract class BaseStore<STATE, ACTIONS> extends EventEmitter<BaseStoreEvents<STATE>> {
    private _state;
    protected readonly dispatcher: Dispatcher<any>;
    constructor(dispatcher: Dispatcher<any>);
    abstract handle<K extends keyof ACTIONS>(type: K, payload: ACTIONS[K]): void;
    abstract getInitialState(): STATE;
    private _handle;
    setState(newState: STATE): void;
    get state(): STATE;
}
export {};
