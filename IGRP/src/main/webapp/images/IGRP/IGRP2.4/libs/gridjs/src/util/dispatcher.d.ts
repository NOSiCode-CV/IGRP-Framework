export default class Dispatcher<TPayload> {
    _callbacks: {
        [key: string]: (payload: TPayload) => void;
    };
    _isDispatching: boolean;
    _isHandled: {
        [key: string]: boolean;
    };
    _isPending: {
        [key: string]: boolean;
    };
    _lastID: number;
    _pendingPayload: TPayload;
    constructor();
    register(callback: (payload: TPayload) => void): string;
    unregister(id: string): void;
    waitFor(ids: Array<string>): void;
    dispatch(payload: TPayload): void;
    isDispatching(): boolean;
    private _invokeCallback;
    private _startDispatching;
    private _stopDispatching;
}
