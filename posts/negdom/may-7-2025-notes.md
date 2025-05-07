Our hero, called Hero, has to make a choice from a set _O_ of options. They turn to decision theory for help. It turns out different decision theorists provide different kinds of answers. Some of them ask a few questions, and return a choice function _C_. The function maps option sets to sets of choiceworthy options. Others, more common in philosophy, ask similar questions, and return a pair of preference functions, > and $\geq$. Intuitively, _a_ $\geq$ _b_ means that _a_ is at least as good, in the respects that matter to Hero's decision, as _b_, while _a_ > _b_ means _a_ is strictly better. These ideological differences might be expected to wash out. One might expect that if all the decision theorists are doing their job, the principle I'll call **Choose Preferred Options** will be true.

Choose Preferred Options
:    _a_ $\in$ _c_(_O_) iff $\neg$$\exists$_x_ $\in$ _O: _x_ > _a_.

That is, an option is choiceworthy iff none of the alternatives are preferred to it. If that's true, there will be a simple translation from preference-talk to choiceworthiness talk. The reverse translation will still take some work, and we'll come back to that below, but if we assume this principle, it will mostly be a matter of personal taste whether we theorise in terms of _c_ or in terms of > and $\geq$.

I'm going to argue that **Choose Preferred Options** is false, and the relationship between choice and preference is much more complicated than it first looks. I'll further argue that many recent debates about so-called incomplete preferences rely on tacitly assuming **Choose Preferred Options**; without it some problems can be dissolved.

The two main examples are going to be familiar, though not obviously connected: the child's game Rock-Paper-Scissors, and Sartre's example of the student torn between joining the resistance and caring for his sick mother. The plan will be to argue that Rock-Paper-Scissors offers a counterexample to **Choose Preferred Options**, and that once we see it is false, we have space to tell a somewhat simpler story about Sartre's student than previously thought possible.

# Values, Preferences, and Choices

Here's a simple way to validate **Choose Preferred Options**. There is a function *v* from options to real numbers, and the following two claims are true.

Value-to-Preference
:    _a_ > _b_ iff _v_(_a_) > _v_(_b_), and _a_ $\geq$ _b_ iff _v_(_a_) $\geq$ _v_(_b_).

Value-to-Choice
:    _a_ $\in$ _c_(_O_) iff $\neg$$\exists$_x_ $\in$ _O: _v_(_x_) > _v_(_a_).

What I'll call the *value first* approach to decision theory says that both of these claims are true, and that they are explanatory in the right-to-left direction. The way value-first theories are typically built is to take the values of various states, typically outcomes, as given, and then from that build a function that assigns values to all choices. There are a few familiar choice points along the way.

- Do lotteries get valued at their expected value, or using some kind of risk-sensitive measure, as in @BuchakRisk.
- How does one solve Newcomb-like problems?
- How does one handle problems about infinite value?
- How does one handle dynamic choice?

Now one could worry about value first approaches because none of the answers to these questions are appealing within that framework. But let's set those aside. (That might mean, in the case of infinite value, simply restricting the scope of the theory.) Instead I'll note some reasons why historically not everyone has been happy with the value first approach.

I say 'historically' because it seems right now that value first approaches are rather popular. 
