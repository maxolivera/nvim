local get_visual = function(args, parent)
	if (#parent.snippet.env.LS_SELECT_RAW > 0) then
		return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
	else -- IF LS_SELECT_RAW is empty, return a blank insert node
		return sn(nil, i(1))
	end
end

return {
	s({ trig = ":a", snippetType = "autosnippet" },
		{
			t("\\alpha"),
		}
	),
	s({ trig = ":b", snippetType = "autosnippet" },
		{
			t("\\beta"),
		}
	),
	s({ trig = ":g", snippetType = "autosnippet" },
		{
			t("\\gamma"),
		}
	),
	-- \frac
	s({ trig = "([^%a])ff", dscr = "Expands 'ff' into '\frac{}{}'", regTrig = true, wordTrig = false },
		fmta(
			[[<>\frac{<>}{<>}]],
			{
				f(function(_, snip) return snip.captures[1] end),
				i(1),
				i(2)
			}
		)
	),
	-- Equation
	s({ trig = "eq", dscr = "Expands 'eq' into an equation environment" },
		fmta(
			[[
       \begin{equation*}
           <>
       \end{equation*}
     ]],
			{ i(1) }
		)
	),
	-- Inline math
	s({ trig = "([^%a])mm", wordTrig = false, regTrig = true },
		fmta(
			"<>$<>$",
			{
				f(function(_, snip) return snip.captures[1] end),
				d(1, get_visual),
			}
		)
	),
	s({ trig = "([%a%]%}])00", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
		fmta("<>_{<>}",
			{
				f(function(_, snip) return snip.captures[1] end),
				t("0")
			}
		)
	),
}
