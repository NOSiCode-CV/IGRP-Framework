import Dispatcher from '../../util/dispatcher';
export declare abstract class BaseActions<ACTIONS> {
    private readonly dispatcher;
    constructor(dispatcher: Dispatcher<any>);
    protected dispatch<K extends keyof ACTIONS>(type: K, payload: ACTIONS[K]): void;
}
