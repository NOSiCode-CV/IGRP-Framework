import { h } from 'preact';
import { TCell } from '../../../types';
import { PluginBaseComponent, PluginBaseProps } from '../../../plugin';
export interface SearchConfig {
    keyword?: string;
    enabled?: boolean;
    ignoreHiddenColumns?: boolean;
    debounceTimeout?: number;
    selector?: (cell: TCell, rowIndex: number, cellIndex: number) => string;
    server?: {
        url?: (prevUrl: string, keyword: string) => string;
        body?: (prevBody: BodyInit, keyword: string) => BodyInit;
    };
}
export declare class Search extends PluginBaseComponent<SearchConfig & PluginBaseProps<Search>> {
    private readonly searchProcessor;
    private readonly actions;
    private readonly store;
    private readonly storeUpdatedFn;
    static defaultProps: {
        debounceTimeout: number;
    };
    constructor(props: any, context: any);
    componentWillUnmount(): void;
    private storeUpdated;
    private onChange;
    render(): h.JSX.Element;
}
