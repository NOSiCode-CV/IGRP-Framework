import { h } from 'preact';
import { BaseComponent } from './base';
interface FooterContainerState {
    isActive: boolean;
}
export declare class FooterContainer extends BaseComponent<Record<string, any>, FooterContainerState> {
    private footerRef;
    constructor(props: any, context: any);
    componentDidMount(): void;
    render(): h.JSX.Element;
}
export {};
