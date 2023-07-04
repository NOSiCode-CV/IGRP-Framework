import { h } from 'preact';
import { PluginBaseComponent, PluginBaseProps } from '../../plugin';
interface PaginationState {
    page: number;
    limit?: number;
    total: number;
}
export interface PaginationConfig {
    enabled: boolean;
    limit?: number;
    page?: number;
    summary?: boolean;
    nextButton?: boolean;
    prevButton?: boolean;
    buttonsCount?: number;
    resetPageOnUpdate?: boolean;
    server?: {
        url?: (prevUrl: string, page: number, limit: number) => string;
        body?: (prevBody: BodyInit, page: number, limit: number) => BodyInit;
    };
}
export declare class Pagination extends PluginBaseComponent<PluginBaseProps<Pagination> & PaginationConfig, PaginationState> {
    private processor;
    private onUpdateFn;
    private setTotalFromTabularFn;
    static defaultProps: {
        summary: boolean;
        nextButton: boolean;
        prevButton: boolean;
        buttonsCount: number;
        limit: number;
        resetPageOnUpdate: boolean;
    };
    constructor(props: any, context: any);
    componentWillMount(): void;
    private setTotalFromTabular;
    private onUpdate;
    componentDidMount(): void;
    componentWillUnmount(): void;
    private get pages();
    private setPage;
    private setTotal;
    renderPages(): h.JSX.Element;
    renderSummary(): h.JSX.Element;
    render(): h.JSX.Element;
}
export {};
