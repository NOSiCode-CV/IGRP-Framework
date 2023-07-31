import { BaseActions } from '../../base/actions';
import { Comparator, TCell } from '../../../types';
export interface SortActionsType {
    SORT_COLUMN: {
        index: number;
        direction: 1 | -1;
        multi?: boolean;
        compare?: Comparator<TCell>;
    };
    SORT_COLUMN_TOGGLE: {
        index: number;
        multi?: boolean;
        compare?: Comparator<TCell>;
    };
}
export declare class SortActions extends BaseActions<SortActionsType> {
    sortColumn(index: number, direction: 1 | -1, multi?: boolean, compare?: Comparator<TCell>): void;
    sortToggle(index: number, multi?: boolean, compare?: Comparator<TCell>): void;
}
