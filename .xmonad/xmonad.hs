-- ~/.xmonad/xmonad.hs
import XMonad
import XMonad.Layout
import XMonad.Layout.IM
import XMonad.Layout.Named
import XMonad.Layout.Tabbed
import XMonad.Layout.Spacing           -- this makes smart space around windows
import XMonad.Util.EZConfig            -- removeKeys, additionalKeys
import XMonad.Util.Run(spawnPipe)      -- spawnPipe, hPutStrLn
import XMonad.Layout.Magnifier         -- this makes window bigger
import XMonad.Layout.ResizableTile     -- Resizable Horizontal border
import XMonad.Layout.ThreeColumns      -- for many windows
import Control.Monad (liftM2)          -- myManageHookShift
import qualified XMonad.StackSet as W  -- myManageHookShift
import System.IO                       -- for xmobar
import XMonad.Hooks.DynamicLog         -- for xmobar
import XMonad.Hooks.ManageDocks        -- avoid xmobar area
import XMonad.Hooks.ManageHelpers      --
import XMonad.Layout.DragPane          -- see only two window
import XMonad.Layout.ToggleLayouts     -- Full window at any time
import XMonad.Layout.NoBorders         -- In Full mode, border is no use
import XMonad.Util.WorkspaceCompare
import XMonad.Actions.CycleWS
import qualified XMonad.Layout.MultiToggle as MT
import XMonad.Layout.MultiToggle.Instances
import XMonad.Config.Desktop (desktopLayoutModifiers)

-- main
main = do
     xmproc <- spawnPipe "xmobar ~/.xmonad/xmobarrc"
     xmonad $ defaultConfig
	{ terminal           = myTerminal
	, modMask            = myModMask
	, borderWidth        = myBorderWidth
        , normalBorderColor  = "#5a908e"
        , focusedBorderColor = "#99cb81"
   -- key bindings
   -- hooks, layouts
        , manageHook         = myManageHook
        , layoutHook         = myLayoutHook
        , logHook            = myLogHook xmproc
        , startupHook        = myStartupHook
        }

	`additionalKeysP`

	[ ("M-<R>", moveTo Next NonEmptyWS)
	, ("M-<L>", moveTo Prev NonEmptyWS)
--	, ("M-S-<R>", do t <- findWorkspace getSortByIndex Next EmptyWS 1
--		 (windows . W.shift) t
--		 (windows . W.greedyView) t)
	, ("M-S-<L>", shiftTo Prev EmptyWS)
	, ("M-f", sendMessage $ ToggleLayout )
	]


-- my settings
myTerminal     = "urxvt"   -- light weight terminal "rxvt-unicode"
myModMask      = mod4Mask  -- Home / Super_L
myBorderWidth  = 2
myLayoutHook   = toggleLayouts (noBorders Full) $ avoidStruts $ myLayout   -- any time Full mode, avoid xmobar area
myManageHook   = myManageShift <+> myManageFloat <+> manageDocks
myLogHook b    = dynamicLogWithPP $ myPP b
myStartupHook  = myStartup


-- Handle Window behaveior
myLayout = (spacing 8 $ ResizableTall 1 (3/100) (1/2) [])
             |||  (magnifiercz 1.2 (ThreeCol 1 (3/100) (1/2)))
             |||  (spacing 2 $ (dragPane Horizontal (1/10) (1/2))
                  ||| (dragPane Vertical   (1/10) (1/2)))


-- some window must created there
myManageShift = composeAll
            -- if you want to know className, type "$ xprop|grep CLASS" on shell
            [ className =? "Firefox" --> viewShift "3"
            , className =? "Opera"   --> viewShift "3"
            ]
            where viewShift = doF . liftM2 (.) W.view W.shift


-- new window will created in Float mode
myManageFloat = composeAll
            [ className =? "MPlayer" --> doFloat
            , className =? "Gimp"    --> doFloat]


myManageFull = composeAll
           [ isFullscreen --> doFullFloat ]

-- xmobar setting
myPP b = xmobarPP
       { ppOutput = hPutStrLn b
       , ppTitle  = xmobarColor "green" "" . shorten 50
       }

-- Start up (at xmonad beggining), like "wallpaper" or so on
myStartup = do
	spawn "feh --bg-fill ~/Image/wallpaper1.png"
        spawn "feh --bg-fill /usr/share/backgrounds/linuxmint/default_background.jpg"
--        spawn "compton --config ~/.config/compton.conf"
        spawn "compton"
	spawn "urxvt"
