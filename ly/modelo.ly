% -*- coding: utf-8 -*-
\version "2.14.2"

\relative c' {
  \override Staff.TimeSignature #'style = #'()
  \override Score.BarNumber #'transparent = ##t
  \override Score.RehearsalMark #'font-size = #-2
  \time 4/4


                                % CORNETA SIB

  \tag #'ct {
    c4
  }

                                % CORNETA FA

  \tag #'ctfa {
    c4
  }

                                % CORNETA MIB

  \tag #'ctmib {
    c4
  }

                                % CORNETÃO SIB

  \tag #'ctao {
    \clef bass
    c4
  }

                                % CORNETÃO FA

  \tag #'ctaofa {
    \clef bass
    c4
  }

                                % CORNETÃO MIB

  \tag #'ctaomib {
    \clef bass
    c4
  }

                                % CONTRABAIXO SIB

  \tag #'bx {
    \clef bass
    c4
  }

                                % CONTRABAIXO FA
  
  \tag #'bxfa {
    \clef bass
    c4
  }

                                % CONTRABAIXO MIB

  \tag #'bxmib {
    \clef bass
    c4
  }

                                % FINAL DO DOCUMENTO

  \bar "|."
}



