import { h, JSX } from 'preact';
import { BaseComponent, BaseProps } from '../../base';
import { Comparator, TCell, TColumnSort } from '../../../types';
export interface SortConfig {
    enabled?: boolean;
    compare?: Comparator<TCell>;
}
export interface GenericSortConfig {
    multiColumn?: boolean;
    server?: {
        url?: (prevUrl: string, columns: TColumnSort[]) => string;
        body?: (prevBody: BodyInit, columns: TColumnSort[]) => BodyInit;
    };
}
export interface SortProps extends BaseProps {
    index: number;
}
interface SortState {
    direction: 1 | -1 | 0;
}
export declare class Sort extends BaseComponent<SortProps & SortConfig, SortState> {
    private readonly sortProcessor;
    private readonly actions;
    private readonly store;
    private readonly updateStateFn;
    private updateSortProcessorFn;
    constructor(props: SortProps & SortConfig, context: any);
    componentWillUnmount(): void;
    private updateState;
    private updateSortProcessor;
    private getOrCreateSortProcessor;
    changeDirection(e: JSX.TargetedMouseEvent<HTMLButtonElement>): void;
    render(): h.JSX.Element;
}
export {};
