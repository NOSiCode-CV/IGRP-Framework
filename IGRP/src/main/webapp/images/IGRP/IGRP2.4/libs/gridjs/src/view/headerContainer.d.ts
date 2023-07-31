import { h } from 'preact';
import { BaseComponent } from './base';
interface HeaderContainerState {
    isActive: boolean;
}
export declare class HeaderContainer extends BaseComponent<Record<string, any>, HeaderContainerState> {
    private headerRef;
    constructor(props: any, context: any);
    componentDidMount(): void;
    render(): h.JSX.Element;
}
export {};
