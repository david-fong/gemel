

mod casing {
	pub enum Separator {
		None, Dash, Underscore,
	}
	pub enum Caps {
		None, First, All,
	}
}
pub struct Casing {
	pub separator: casing::Separator;
	pub caps: casing::Caps;
}

mod display_rules {
	pub enum TrailingComma {
		BeforeNewline, Never, Always,
	}
	pub struct Casing {
		pub folder: super::Casing;
		pub var: super::Casing;
		pub enum: super::Casing;
		pub type: super::Casing;
	}
}
pub struct DisplayRules {
	pub indent_width: u8;
	//. Setting this to zero turns off soft-wrapping.
	pub page_width: u8;
	pub casing: {

	};
	pub trailing_comma: display_rules::TrailingComma;
	pub line_break: {
		pub before_opening_block: bool;
	}
}