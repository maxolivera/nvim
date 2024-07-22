return {
	-- Italic
	s({ trig = "tii" },
		fmta("\\textit{<>}",
			{
				d(1, get_visual),
			}
		)
	),
	-- Monospace
	s({ trig = "tt", dscr = "Expands 'tt' into '\texttt{}'" },
		fmta(
			"\\texttt{<>}",
			{ i(1) }
		)
	),
}
