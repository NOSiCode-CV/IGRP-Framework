import { ID } from './util/id';
declare class Base {
    private readonly _id;
    constructor(id?: ID);
    get id(): ID;
}
export default Base;
