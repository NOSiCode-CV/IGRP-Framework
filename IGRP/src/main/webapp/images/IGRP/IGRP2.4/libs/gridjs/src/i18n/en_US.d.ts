declare const _default: {
    search: {
        placeholder: string;
    };
    sort: {
        sortAsc: string;
        sortDesc: string;
    };
    pagination: {
        previous: string;
        next: string;
        navigate: (page: any, pages: any) => string;
        page: (page: any) => string;
        showing: string;
        of: string;
        to: string;
        results: string;
    };
    loading: string;
    noRecordsFound: string;
    error: string;
};
export default _default;
