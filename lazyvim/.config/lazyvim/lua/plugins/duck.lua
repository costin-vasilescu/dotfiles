return {
	{
		"tamton-aquib/duck.nvim",
		config = function()
			-- Timing parameters (in milliseconds)
			local INITIAL_IDLE_DELAY = 20000 -- Wait time before 1st duck
			local FLOCK_SPAWN_INTERVAL = 2000 -- Time between extra ducks
			local MAX_DUCKS = 30 -- Max ducks in flock

			local state_timer = vim.uv.new_timer()
			local is_idle_active = false
			local duck_count = 0

			-- Stop animation and remove all ducks
			local function stop_animations()
				if not is_idle_active then
					return
				end

				-- Cook ducks if any exist
				if duck_count > 0 then
					pcall(function()
						require("duck").cook_all()
					end)
				end

				is_idle_active = false
				duck_count = 0
			end

			-- Spawn ducks progressively up to MAX_DUCKS
			local function spawn_duck_step()
				is_idle_active = true

				if duck_count < MAX_DUCKS then
					duck_count = duck_count + 1
					pcall(function()
						require("duck").hatch("🦆", 8)
					end)

					-- Schedule the next duck spawn
					if state_timer then
						state_timer:start(FLOCK_SPAWN_INTERVAL, 0, vim.schedule_wrap(spawn_duck_step))
					end
				end
			end

			-- Reset timer on user input
			local function reset_idle_timer()
				stop_animations()

				if state_timer then
					state_timer:stop()
					state_timer:start(INITIAL_IDLE_DELAY, 0, vim.schedule_wrap(spawn_duck_step))
				end
			end

			-- 1. Reset on keypress
			vim.on_key(function()
				reset_idle_timer()
			end)

			-- 2. Reset on cursor movement or window switches
			vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI", "WinEnter" }, {
				callback = function()
					reset_idle_timer()
				end,
			})

			-- Start initial countdown
			reset_idle_timer()
		end,
	},
}
