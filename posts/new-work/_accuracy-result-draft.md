The result underwriting this section is not new, and is worth stating in a form that
shows how little it assumes. It is a theorem of @DeFinetti1974, generalised by
@Lindley1982 and given in the form I'll use here by @Predd2009.

Their framework is spare. Fix a non-empty sample space $\Omega$ and a finite list $E_1,
\ldots, E_n$ of subsets of it, which we call events. A _forecast_ is a vector $f \in
[0,1]^n$, one number per event. It is _coherent_ just in case there is a probability
measure $\mu$ over $\Omega$ with $f_i = \mu(E_i)$ for each $i$. Two features matter. The
events need not form an algebra; they may be any finite collection of subsets. And
$\Omega$ itself may be infinite --- only the agenda, the number of events one has
credences in, must be finite. Predd and his co-authors add that the case where the
events are logically entangled, so that not every combination of truth values is
realised, is "the case of interest".

The first result is a geometrical characterisation of coherence, due to de Finetti. For
each $\omega \in \Omega$, let $v_\omega$ record the truth values of the events at
$\omega$, assigning 1 to each $E_i$ containing $\omega$ and 0 to the rest. These are the
forecasts that could be perfectly accurate: $v_\omega$ is exactly right if $\omega$ is
how things turn out. Let $V$ be the set of them. Then $f$ is coherent if and only if it
lies in the convex hull of $V$: if and only if it is a weighted average of the
potentially perfect forecasts, with non-negative weights summing to one.

The second result connects this to accuracy. Score a forecast at $\omega$ by applying a
proper scoring rule to each event and summing. A forecast is strongly dominated if some
rival scores better at every point of $\Omega$, and weakly dominated if some distinct
rival scores at least as well everywhere. A coherent forecast is not weakly dominated by
anything; an incoherent one is strongly dominated by something coherent. Coherence and
immunity from accuracy domination turn out to be one property under two
descriptions.[^scoring]

[^scoring]: The scoring rule must be proper in the strict sense that announcing one's
    true credence uniquely minimises expected penalty. Merely proper rules leave only
    the weaker claim that incoherent forecasts are weakly dominated; @Predd2009 give a
    counterexample. On how far propriety and continuity can be relaxed see @Pruss2024,
    and on infinite agendas see @Kelley2023.

To apply this, take the sample space to be the possibilities of the frame rather than
the worlds, and let the events be the propositions. The first of those is the
substantive commitment: I am treating the possibilities, and not merely the worlds, as
ways things might be, and hence as the points at which accuracy is assessed. That is
what @sec-sec3 argued for. The mathematics takes it as input rather than establishing
it.

Given it, the rest is mechanical. Each proposition $A$ determines the set of
possibilities at which it is true. Because persistence and refinability hold across the
whole language --- for the connectives by Humberstone's results, and for $\Box_i$ given
**R-Win** --- $A$ is true at a possibility $x$ just in case $A$ is true at every world
refining $x$. The perfectly accurate credence at $x$ therefore assigns 1 to $A$ when
$x$'s refinements settle $A$, and 0 otherwise. A coherent credal state is a weighted
average of these: it distributes weights $w_x$ over the possibilities and sets $Bel(A)$
to the total weight on possibilities where $A$ is true.

Writing $S_x$ for the set of worlds refining $x$, this is $Bel(A) = \sum_{X \subseteq A}
m(X)$, where $m(X)$ is the total weight carried by possibilities whose refinements are
exactly $X$. So $Bel$ is a Dempster-Shafer belief function and $m$ is its mass function.
That is no coincidence. It is @Dempster1967's original construction, in which a
probability distribution over one space induces a lower probability over another through
a multivalued mapping; here the mapping is $x \mapsto S_x$. One consequence is that mass
sits only on sets of worlds that some possibility leaves open, so which belief functions
are available depends on how rich the frame is.

Two conclusions follow. The first is that non-probabilistic credence is coherent. The
perfectly accurate credence at $x_1$ gives $\Box_{ER} p$ and $\neg \Box_{ER} p$ zero
apiece while giving their disjunction one, which no probability function does; and it is
undominated for an unimpressive reason: its inaccuracy at $x_1$ is zero, and nothing
beats zero. So probabilism is not a requirement of accuracy here. The accuracy argument
does not simply fail in this setting. It delivers a weaker constraint in probabilism's
place.

The second conclusion says what non-probabilistic credence _means_. The weights $w_x$
are not an artefact of the representation. By de Finetti's characterisation they are a
probability distribution over the possibilities, which is to say a credence about which
environment one is in. To hold a belief function that is not a probability function is
to put weight on a possibility that leaves a question open --- to think it tolerably
likely that one is somewhere there is no fact of the matter about whether The Couple
have grandchildren. Superadditivity is not a rival to probabilism about one's evidential
state. It is ordinary probabilism about which state one is in, seen through a language
in which a disjunction can be settled when neither disjunct is.
