return {
	{
		"folke/which-key.nvim",
		opts = {
			spec = {
				{ "<leader>t", group = "triforce", icon = "󰌌" },
			},
		},
	},
	{
		"nvzone/volt",
		lazy = true,
	},
	{
		"gisketch/triforce.nvim",
		dependencies = { "nvzone/volt" },
		keys = {
			{
				"<leader>tp",
				function()
					require("triforce").show_profile()
				end,
				desc = "Profile",
			},
		},
		opts = {
			levels = {
				[1] = { title = "Dirt Hut Architect", icon = "🌱" }, -- Minecraft
				[5] = { title = "Third-Rate Duelist", icon = "🃏" }, -- Yu-Gi-Oh!
				[10] = { title = "Hearthian Hatchling", icon = "🏕️" }, -- Outer Wilds
				[20] = { title = "Drowners Bane", icon = "🌊" }, -- The Witcher
				[30] = { title = "Mudcrab Brawler", icon = "🦀" }, -- Elder Scrolls
				[40] = { title = "Wall of Flesh Destroyer", icon = "🥩" }, -- Terraria
				[50] = { title = "Thieves Guild Master", icon = "🗝️" }, -- Elder Scrolls
				[60] = { title = "Obelisk Blue Elite", icon = "🔵" }, -- Yu-Gi-Oh!
				[70] = { title = "Nomai Translator", icon = "📜" }, -- Outer Wilds
				[80] = { title = "Legendary Duelist", icon = "⚔️" }, -- Yu-Gi-Oh!
				[90] = { title = "Child of the Elder Blood", icon = "✨" }, -- The Witcher
				[100] = { title = "Dragonborn", icon = "🐉" }, -- Elder Scrolls
				[110] = { title = "Ender Dragon Slayer", icon = "🐉" }, -- Minecraft
				[120] = { title = "Dark Brotherhood Listener", icon = "🗡️" }, -- Elder Scrolls
				[135] = { title = "Mechanical Boss Slayer", icon = "🤖" }, -- Terraria
				[150] = { title = "Butcher of Blaviken", icon = "🩸" }, -- The Witcher
				[165] = { title = "King of Games", icon = "👑" }, -- Yu-Gi-Oh!
				[180] = { title = "Lord of Frenzied Flame", icon = "🔥" }, -- Elden Ring
				[200] = { title = "Quantum Observer", icon = "⚛️" }, -- Outer Wilds
				[210] = { title = "Moon Lord Vanquisher", icon = "🦑" }, -- Terraria
				[225] = { title = "Elden Lord", icon = "🟡" }, -- Elden Ring
				[240] = { title = "Hardcore Legend", icon = "🖤" }, -- Minecraft
				[250] = { title = "Master of the Millennium Items", icon = "👁️" }, -- Yu-Gi-Oh!
				[260] = { title = "White Wolf of Rivia", icon = "🐺" }, -- The Witcher
				[270] = { title = "Eye of the Universe Explorer", icon = "🌌" }, -- Outer Wilds
				[280] = { title = "Nerevarine", icon = "💍" }, -- Elder Scrolls
				[285] = { title = "Empress of Light Conqueror", icon = "🦋" }, -- Terraria
				[290] = { title = "Zenith Forger", icon = "⚔️" }, -- Terraria
				[295] = { title = "Pharaoh Nameless", icon = "🏺" }, -- Yu-Gi-Oh!
				[300] = { title = "CHIM Attainer", icon = "🌀" }, -- Elder Scrolls
			},
			achievements = {
				-- =========================================================================
				-- ELDER SCROLLS ACHIEVEMENTS
				-- =========================================================================
				{
					id = "arrow_to_the_knee",
					name = "Arrow in the Knee",
					icon = "🏹",
					desc = "Code continuously for 2 hours (7200 seconds) in a single session",
					check = function(stats)
						return (stats and stats.time_coding or 0) >= 7200
					end,
				},
				{
					id = "chim_attainer",
					name = "Attain CHIM",
					icon = "🌀",
					desc = "Reach Level 300 in your coding journey",
					check = function(stats)
						return (stats and stats.level or 0) >= 300
					end,
				},
				{
					id = "daedric_offering",
					name = "Daedric Artifact",
					icon = "🗡️",
					desc = "Type 50,000 characters across all languages",
					check = function(stats)
						return (stats and stats.chars_typed or 0) >= 50000
					end,
				},

				-- =========================================================================
				-- THE WITCHER ACHIEVEMENTS
				-- =========================================================================
				{
					id = "toss_a_coin",
					name = "Toss a Coin to Your Coder",
					icon = "🪙",
					desc = "Complete 25 coding sessions",
					check = function(stats)
						return (stats and stats.sessions or 0) >= 25
					end,
				},
				{
					id = "gwent_addict",
					name = "Up for a Game of Gwent?",
					icon = "🃏",
					desc = "Maintain a 7-day coding streak",
					check = function(stats)
						return (stats and stats.current_streak or 0) >= 7
					end,
				},
				{
					id = "witchers_code",
					name = "Path of the Wolf",
					icon = "🐺",
					desc = "Type 2,500 total lines of code",
					check = function(stats)
						return (stats and stats.lines_typed or 0) >= 2500
					end,
				},

				-- =========================================================================
				-- ELDEN RING ACHIEVEMENTS
				-- =========================================================================
				{
					id = "maidenless_no_more",
					name = "Maidenless No More",
					icon = "💍",
					desc = "Reach Level 50",
					check = function(stats)
						return (stats and stats.level or 0) >= 50
					end,
				},
				{
					id = "frenzied_flame_grind",
					name = "May Chaos Take the World!",
					icon = "🔥",
					desc = "Type 5,000 lines of code",
					check = function(stats)
						return (stats and stats.lines_typed or 0) >= 5000
					end,
				},
				{
					id = "elden_lord",
					name = "Elden Lord",
					icon = "🟡",
					desc = "Reach Level 200",
					check = function(stats)
						return (stats and stats.level or 0) >= 200
					end,
				},

				-- =========================================================================
				-- OUTER WILDS ACHIEVEMENTS
				-- =========================================================================
				{
					id = "supernova_loop",
					name = "22-Minute Loop",
					icon = "⌛",
					desc = "Code for over 22 minutes (1,320 seconds) total",
					check = function(stats)
						return (stats and stats.time_coding or 0) >= 1320
					end,
				},
				{
					id = "nomai_translator",
					name = "Nomai Linguist",
					icon = "📜",
					desc = "Write code in 4 different programming languages",
					check = function(stats)
						local count = 0
						if stats and stats.chars_by_language then
							for _ in pairs(stats.chars_by_language) do
								count = count + 1
							end
						end
						return count >= 4
					end,
				},
				{
					id = "eye_of_the_universe",
					name = "Conscious Observer",
					icon = "🌌",
					desc = "Maintain a 30-day continuous coding streak",
					check = function(stats)
						return (stats and stats.longest_streak or 0) >= 30
					end,
				},

				-- =========================================================================
				-- YU-GI-OH! ACHIEVEMENTS
				-- =========================================================================
				{
					id = "heart_of_the_cards",
					name = "Heart of the Cards",
					icon = "🃏",
					desc = "Type 1,000 lines of clean code",
					check = function(stats)
						return (stats and stats.lines_typed or 0) >= 1000
					end,
				},
				{
					id = "exodia_assembly",
					name = "Exodia, Obliterate!",
					icon = "🖐️",
					desc = "Type 250,000 characters total",
					check = function(stats)
						return (stats and stats.chars_typed or 0) >= 250000
					end,
				},
				{
					id = "king_of_games",
					name = "King of Games",
					icon = "👑",
					desc = "Reach Level 165",
					check = function(stats)
						return (stats and stats.level or 0) >= 165
					end,
				},

				-- =========================================================================
				-- TERRARIA ACHIEVEMENTS
				-- =========================================================================
				{
					id = "hardmode_unlocked",
					name = "Wall of Flesh Defeated",
					icon = "🥩",
					desc = "Accumulate 100,000 total experience points",
					check = function(stats)
						return (stats and stats.xp or 0) >= 100000
					end,
				},
				{
					id = "zenith_crafted",
					name = "Zenith Forger",
					icon = "⚔️",
					desc = "Code in 7 different programming languages",
					check = function(stats)
						local count = 0
						if stats and stats.chars_by_language then
							for _ in pairs(stats.chars_by_language) do
								count = count + 1
							end
						end
						return count >= 7
					end,
				},

				-- =========================================================================
				-- MINECRAFT ACHIEVEMENTS
				-- =========================================================================
				{
					id = "getting_wood",
					name = "Getting Wood",
					icon = "🪵",
					desc = "Type your first 500 characters",
					check = function(stats)
						return (stats and stats.chars_typed or 0) >= 500
					end,
				},
				{
					id = "cover_me_in_diamonds",
					name = "Cover Me with Diamonds!",
					icon = "💎",
					desc = "Code for 50 total hours (180,000 seconds)",
					check = function(stats)
						return (stats and stats.time_coding or 0) >= 180000
					end,
				},
				{
					id = "hardcore_survivor",
					name = "Hardcore Legend",
					icon = "🖤",
					desc = "Complete 150 separate coding sessions",
					check = function(stats)
						return (stats and stats.sessions or 0) >= 150
					end,
				},
			},
		},
	},
}
