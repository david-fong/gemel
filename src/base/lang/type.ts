
export interface Type {
	id: Type.Id;
	params: {
		type: Type;
		id: number;
		name: string;
	}[];
}
export namespace Type {
	export enum Id {
		nothing,
		bit,
		u08, u16, u32, u64,
		i08, i16, i32, i64,
		f32, f64,
		text,
		array, list, set, dict,
		fn, enum, object,
	}
}