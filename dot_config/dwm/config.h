/* See LICENSE file for copyright and license details. */

/* Constants */
#define TERMINAL "st"
#define TERMCLASS "St"

/* appearance */
static const unsigned int borderpx  = 3;        /* border pixel of windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const unsigned int gappih    = 10;       /* horiz inner gap between windows */
static const unsigned int gappiv    = 5;       /* vert inner gap between windows */
static const unsigned int gappoh    = 10;       /* horiz outer gap between windows and screen edge */
static const unsigned int gappov    = 10;       /* vert outer gap between windows and screen edge */
static const int smartgaps          = 0;        /* 1 means no outer gap when there is only one window */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const char *fonts[]          = { "monospace:size=12" };
static const char dmenufont[]       = "monospace:size=12";
static const char col_gray1[]       = "#222222";
static const char col_gray2[]       = "#444444";
static const char col_gray3[]       = "#bbbbbb";
static const char col_gray4[]       = "#eeeeee";
static const char col_cyan[]        = "#005577";
static const char *colors[][3]      = {
	/*               fg         bg         border   */
	[SchemeNorm] = { col_gray3, col_gray1, col_gray2 },
	[SchemeSel]  = { col_gray4, col_cyan,  col_cyan  },
};

typedef struct {
	const char *name;
	const void *cmd;
} Sp;
const char *spcmd1[] = {TERMINAL, "-n", "spterm", "-g", "120x34",                                                   NULL };
const char *spcmd2[] = {TERMINAL, "-n", "spfm",   "-g", "144x41", "-e", "ranger",                                   NULL };
const char *spcmd3[] = {TERMINAL, "-n", "spcalc", "-g", "50x20",  "-e", "bc",     "-lq", NULL };
/* const char *spcmd4[] = {"keepassxc", NULL }; */
static Sp scratchpads[] = {
	/* name          cmd  */
	{"spterm",      spcmd1},
	{"spranger",    spcmd2},
	{"spcalc",      spcmd3},
	/* {"keepassxc",   spcmd4}, */
};

/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9" };
static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class      instance      title       tags mask     isfloating   monitor */
	{ "Gimp",	    NULL,			    NULL,		    0,				    1,			    -1 },
	{ "Firefox",  NULL,			    NULL,		    1 << 8,			  0,			    -1 },
	{ NULL,		    "spterm",		  NULL,		    SPTAG(0),		  1,			    -1 },
	{ NULL,		    "spfm",		    NULL,		    SPTAG(1),		  1,			    -1 },
	{ NULL,		    "spcalc",	    NULL,		    SPTAG(2),		  1,			    -1 },
	/* { NULL,		    "keepassxc",  NULL,		    SPTAG(3),		  0,			    -1 }, */
};

/* layout(s) */
static const float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen = 1; /* 1 will force focus on the fullscreen window */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },    /* first entry is default */
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ "[M]",      monocle },
};

/* key definitions */
#define MODKEY Mod1Mask
#define SUPER Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", col_gray1, "-nf", col_gray3, "-sb", col_cyan, "-sf", col_gray4, NULL };
static const char *termcmd[]  = { "st", NULL };

#include <X11/XF86keysym.h>
#include "shiftview.c"


static Key keys[] = {
	/* modifier                     key        function        argument */

  /* General key settings */
	{ MODKEY,                       XK_d,      spawn,          {.v = dmenucmd } },
	{ MODKEY,                       XK_Return, spawn,          {.v = termcmd } },
	{ MODKEY,			                  XK_w,		   spawn,		       SHCMD("google-chrome-stable") },
	{ MODKEY,			                  XK_s,		   spawn,		       SHCMD("slack") },
	{ MODKEY,			                  XK_z,		   spawn,		       SHCMD("zulip") },
	{ MODKEY,                       XK_b,      togglebar,      {0} },
	{ MODKEY|ShiftMask,             XK_q,      quit,           {0} },

  /* Navigation */
	{ MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,      focusstack,     {.i = -1 } },
  { MODKEY,                       XK_n,      shiftview,      {.i = +1 } },
  { MODKEY|ShiftMask,             XK_n,      shiftview,      {.i = -1 } },
	{ MODKEY,                       XK_0,      view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },
	{ MODKEY,                       XK_Tab,    view,           {0} },
	{ MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period, focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
	TAGKEYS(                        XK_8,                      7)
	TAGKEYS(                        XK_9,                      8)

  /* Window manipulation */
	{ MODKEY,                       XK_space,  zoom,           {0} },
	{ MODKEY|ShiftMask,             XK_h,      setmfact,       {.f = -0.05} },
	{ MODKEY|ShiftMask,             XK_l,      setmfact,       {.f = +0.05} },
	{ MODKEY,                       XK_i,      incnmaster,     {.i = +1 } },
	{ MODKEY,                       XK_u,      incnmaster,     {.i = -1 } },
	{ MODKEY,                       XK_f,      fullscreen,     {0} },
	{ MODKEY,                       XK_q,      killclient,     {0} },

	{ MODKEY|ShiftMask,  			      XK_Return, togglescratch,  {.ui = 0 } },
	{ MODKEY,            			      XK_r,	     togglescratch,  {.ui = 1 } },
	{ MODKEY,            			      XK_c,	     togglescratch,  {.ui = 2 } },

	{ MODKEY,                       XK_t,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY|ShiftMask,             XK_t,      setlayout,      {.v = &layouts[1]} },
	{ MODKEY,                       XK_y,      setlayout,      {.v = &layouts[2]} },
	// { MODKEY|ShiftMask,             XK_y,      setlayout,      {.v = &layouts[3]} }, // No fourth layout atm...

  /* Floating windows */
	{ MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },
	{ SUPER,                       XK_j,      moveresize,     {.v = "0x 25y 0w 0h" } },
	{ SUPER,                       XK_k,      moveresize,     {.v = "0x -25y 0w 0h" } },
	{ SUPER,                       XK_l,      moveresize,     {.v = "25x 0y 0w 0h" } },
	{ SUPER,                       XK_h,      moveresize,     {.v = "-25x 0y 0w 0h" } },
	{ SUPER|ShiftMask,             XK_j,      moveresize,     {.v = "0x 0y 0w 25h" } },
	{ SUPER|ShiftMask,             XK_k,      moveresize,     {.v = "0x 0y 0w -25h" } },
	{ SUPER|ShiftMask,             XK_l,      moveresize,     {.v = "0x 0y 25w 0h" } },
	{ SUPER|ShiftMask,             XK_h,      moveresize,     {.v = "0x 0y -25w 0h" } },
	{ SUPER|ControlMask,           XK_k,      moveresizeedge, {.v = "t"} },
	{ SUPER|ControlMask,           XK_j,      moveresizeedge, {.v = "b"} },
	{ SUPER|ControlMask,           XK_h,      moveresizeedge, {.v = "l"} },
	{ SUPER|ControlMask,           XK_l,      moveresizeedge, {.v = "r"} },
	{ SUPER|ControlMask|ShiftMask, XK_k,      moveresizeedge, {.v = "T"} },
	{ SUPER|ControlMask|ShiftMask, XK_j,      moveresizeedge, {.v = "B"} },
	{ SUPER|ControlMask|ShiftMask, XK_h,      moveresizeedge, {.v = "L"} },
	{ SUPER|ControlMask|ShiftMask, XK_l,      moveresizeedge, {.v = "R"} },

  /* Brightness */
	{ 0, XF86XK_MonBrightnessUp,	  spawn,		SHCMD("xbacklight -inc 5") },
	{ 0, XF86XK_MonBrightnessDown,	spawn,		SHCMD("xbacklight -dec 5") },

  /* Window gaps */
	{ MODKEY|Mod4Mask,              XK_h,      incrgaps,       {.i = +1 } },
	{ MODKEY|Mod4Mask,              XK_l,      incrgaps,       {.i = -1 } },
	{ MODKEY|Mod4Mask|ShiftMask,    XK_h,      incrogaps,      {.i = +1 } },
	{ MODKEY|Mod4Mask|ShiftMask,    XK_l,      incrogaps,      {.i = -1 } },
	{ MODKEY|Mod4Mask|ControlMask,  XK_h,      incrigaps,      {.i = +1 } },
	{ MODKEY|Mod4Mask|ControlMask,  XK_l,      incrigaps,      {.i = -1 } },
	{ MODKEY|Mod4Mask,              XK_0,      togglegaps,     {0} },
	{ MODKEY|Mod4Mask|ShiftMask,    XK_0,      defaultgaps,    {0} },
	{ MODKEY,                       XK_y,      incrihgaps,     {.i = +1 } },
	{ MODKEY,                       XK_o,      incrihgaps,     {.i = -1 } },
	{ MODKEY|ControlMask,           XK_y,      incrivgaps,     {.i = +1 } },
	{ MODKEY|ControlMask,           XK_o,      incrivgaps,     {.i = -1 } },
	{ MODKEY|Mod4Mask,              XK_y,      incrohgaps,     {.i = +1 } },
	{ MODKEY|Mod4Mask,              XK_o,      incrohgaps,     {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_y,      incrovgaps,     {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_o,      incrovgaps,     {.i = -1 } },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button1,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};
