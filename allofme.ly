\version "2.20.0"

#(set-global-staff-size 18)

\include "jazzchords.ily"
\include "lilyjazz.ily"

\paper {
  #(define fonts
     (set-global-fonts
      #:music "lilyjazz"
      #:roman "Pea Missy with a Marker"
      #:sans "Pea Missy with a Marker"
      #:factor (/ staff-height pt 20)))
}

\paper {
  indent = 0\mm
  between-system-space = 2.5\cm
  between-system-padding = #0
  % Set to ##t if your score is less than one page:
  ragged-last-bottom = ##f
  ragged-bottom = ##f
  markup-system-spacing = #'((basic-distance . 23)
                             (minimum-distance . 8)
                             (padding . 1))
}

title = #"All of Me"
composer = #"Simons & Marks"
meter = #"(Med. Swing)"

realBookTitle = \markup {
  \score {
    {
      \override TextScript.extra-offset = #'(0 . -4.5)
      s4
      s^\markup {
        \fill-line {
          \fontsize #1 \lower #1 \rotate #7 \concat { " " #(string-upcase meter) }
          \fontsize #8
          \override #'(offset . 7)
          \override #'(thickness . 6)
          \underline \sans #(string-upcase title)
          \fontsize #1 \lower #1 \concat { "- " #(string-upcase composer) " " }
        }
      }
      s
    }
    \layout {
      \once \override Staff.Clef.stencil = ##f
      \once \override Staff.TimeSignature.stencil = ##f
      \once \override Staff.KeySignature.stencil = ##f
      ragged-right = ##f
      \override TextScript.font-name = #"Pea Missy with a Marker"
    }
  }
}

\header {
  pdftitle = \title
  title = \realBookTitle
  source = "http://leighverlag.blogspot.com/2015/12/mimicking-real-book-look.html"
  author = \markup \fromproperty #'header:composer
  subject = \markup \concat { \fromproperty #'header:pdftitle " Jazz Partition" }
  keywords = #(string-join '(
    "music"
    "partition"
    "jazz"
  ) ", ")
  tagline = ##f
}

theNotes = \relative c' {
  \set Staff.midiInstrument = "flute"
  \key c \major
  \bar "[|:"
  \repeat volta 2 {
    c'4 g8 e ~ e2 ~ |
    e2 \tuplet 3/2 { c'4 d c } |
    b4 gis8 e ~ e2 ~ |
    e1 |\break
    a4. g8 e2 ~ |
    e4 dis e8 bes' a4 |
    g2 f2 ~ |
    f1 |\break
    e4. ees8 d2 ~ |
    d2 e8 gis c4 |
    d2 c2 ~ |
    c1 | \break
    b4. bes8 a2 ~ |
    a2 a8 d b4 |
    a1 |
    b1 \bar "||" \break
    c4 g8 e ~ e2 ~ |
    e2 \tuplet 3/2 { c'4 d c } |
    b4 gis8 e ~ e2 ~ |
    e1 | \break
    a4. g8 e2 ~ |
    e4 dis e8 bes' a4 |
    g2 f2 ~ |
    f1 | \break
  }
  \alternative {
    {
      d'2 c4 b |
      d2. c4 |
      b2 e,4 g4 |
      b2. a4 | \break
      c2 a4 c |
      e2 e2 |
      c1 ~ |
      c1 \bar ":|][|:" \break
    }
    {
      d2 c4 b |
      d2. c4 |
      b2 e,4 g4 |
      b2. a4 | \break
      c2 a4 c |
      e2 e2 |
      c1 ~ |
      c1 \bar ":|]"
    }
  }
}

theChords = \chordmode {
  \repeat volta 2 {
    c1:maj c1:maj e:7 e:7 |
    a:7 a:7 d:m7 d:m7 |
    e:7 e:7 a:m7 a:m7 |
    d:7 d:7 d:m7 g:7 |
    c1:maj c1:maj e:7 e:7 |
    a:7 a:7 d:m7 d:m7 |
  }
  \alternative {
    {
      f1 f:m c2:maj e:m7 a1:7 |
      d:m7 g:7 c2:6 ees:dim d2:m7 g:7 |
    }
    {
      f1 f:m c2:maj e:m7 a1:7 |
      d:m7 g:7 c1:6 c1:6 |
    }
  }
}

theWords = \lyricmode {
  \repeat "volta" 2 {
    All of me
    Why not take all of me
    Can't you see
    I'm no good with -- out you

    Take my lips
    I want to lose them
    Take my arms
    I ne -- ver use them

    Your Good -- bye
    Left me with eyes that cry
    How can I go on dear with -- out you
  }
  \alternative {
    {
      You took the part
      That once was my heart
      So why not take all of me
    }
    {
      You took the best
      So why not take the rest
      Ba -- by take all of me.
    }
  }
}

\score {
  <<
    \new ChordNames \theChords
    \new Voice = vocals \theNotes
    \new Lyrics \lyricsto vocals \theWords
  >>
  \layout {
    % Make only the first clef visible
    \override Score.Clef #'break-visibility = #'#(#f #f #f)
    % Make only the first time signature visible
    \override Score.KeySignature #'break-visibility = #'#(#f #f #f)
    % Allow single-staff system bars
    \override Score.SystemStartBar #'collapse-height = #1
    \override LyricHyphen.thickness = #4
    \override Score.VoltaBracket.font-name = #"Pea Missy with a Marker"
  }
  \midi {
    \tempo 4 = 88
  }
}
