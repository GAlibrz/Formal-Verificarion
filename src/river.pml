
bool a1, a2, a3, act1, act2, act3;

init{
    a1 = false;
    a2 = false;
    a3 = false;
    act1 = false;
    act2 = false;
    act3 = false;

    do
    :: (act1 == act2) -> d_step { act1 = !act1; act2 = !act2; printf("actor one and actor two cross the river\n"); }
    :: (act2 == act3) -> d_step { act2 = !act2; act3 = !act3; printf("actor two and actor three cross the river\n"); }
    :: (act1 == act3) -> d_step { act1 = !act1; act3 = !act3; printf("actor one and actor three cross the river\n"); }
    :: (a1 == a2) -> d_step { a1 = !a1; a2 = !a2; printf("agent 1 and agent 2 cross the river\n"); }
    :: (a2 == a3) -> d_step { a2 = !a2; a3 = !a3; printf("agent 2 and agent 3 cross the river\n"); }
    :: (a1 == a3) -> d_step { a1 = !a1; a3 = !a3; printf("agent 1 and agent 3 cross the river\n"); }
    :: (a1 == act1) -> d_step {a1 = !a1; act1 = !act1; printf("agent 1 and actor 1 cross the river\n"); }
    :: (a2 == act2) -> d_step {a2 = !a2; act2 = !act2; printf("agent 2 and actor 2 cross the river\n"); }
    :: (a3 == act3) -> d_step {a3 = !a3; act3 = !act3; printf("agent 3 and actor 3 cross the river\n"); }
    :: d_step{ a1 = !a1; printf("agent 1 crosses individually"); }
    :: d_step{ a2 = !a2; printf("agent 2 crosses individually"); }
    :: d_step{ a3 = !a3; printf("agent 3 crosses individually"); }
    :: d_step{ act1 = !act1; printf("actor 1 crosses individually"); }
    :: d_step{ act2 = !act2; printf("actor 2 crosses individually"); }
    :: d_step{ act3 = !act3; printf("actor 3 crosses individually"); }
    od

}

#define POACH (((act1 != a1) && (act1 == a2 || act1 == a3)) \
|| ((act2 != a2) && (act2 == a1 || act2 == a3)) \
|| ((act3 != a3) && (act3 == a1 || act3 == a2)))

ltl no_solution {! ((!POACH) U (a1 && a2 && a3 && act1 && act2 && act3))}   