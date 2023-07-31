import BaseStore from '../../base/store';
import { SortActionsType } from './actions';
import { Comparator, TCell } from '../../../types';
export declare type SortStoreState = {
    index: number;
    direction: 1 | -1;
    compare?: Comparator<TCell>;
}[];
export declare class SortStore extends BaseStore<SortStoreState, SortActionsType> {
    getInitialState(): SortStoreState;
    handle(type: any, payload: any): void;
    private sortToggle;
    private sortColumn;
}
