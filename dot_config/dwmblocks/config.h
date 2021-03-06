//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
	{"",    "sb-forecast",          60,		25},
	{"",    "sb-cpu",                5,		20},
	{"",    "sb-internet",           1,		 5},
	{"",    "sb-parupackages",      60,		30},
	{"",    "sb-battery",            1,		 7},
	{"",    "sb-date",              60,		 2},
	// {"",    "sb-time",               2,		 1},
	{"",    "sb-bluetooth",          2,		11},
	{"",    "sb-volume",             0,		10},
	// {"",    "sb-help-icon",          0,		15},
};

//sets delimeter between status commands. NULL character ('\0') means no delimeter.
static char delim[] = "  ";
static unsigned int delimLen = 5;
