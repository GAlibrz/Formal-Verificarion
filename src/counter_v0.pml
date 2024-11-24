
/*
    the minimum global counter possible for the setting of the problem is 2 
    after some experiments with the code it seems that the minimum possible is 
    min(min (A0, A1, ..., An), (|Ai - Aj|; for all i and j given i != j )

*/

#define N 3

int values[N];
bool finished[N];
int global_counter;


proctype counter(int inital_value; int counter_id){
    int current_value = inital_value;
    do
        :: current_value > 0 ->
            int local_global_value = global_counter;
            printf("**** counter number %d just copied value %d as its global value \n", counter_id, local_global_value);
            local_global_value++;
            current_value--;
            global_counter = local_global_value;
            printf("**** counter number %d just updated global counter with value %d , previous global counter value was: %d \n", counter_id, local_global_value, global_counter);
            :: current_value == 0 ->
                finished[counter_id] = true;
                
        :: else ->
            break
    od

}
init {
    global_counter = 0;
    values[0] = 1;
    values[1] = 4;
    values[2] = 5;
    /*values[3] = 4;
    values[4] = 1;*/
    atomic {
        int idx = 0;
        do
        :: idx < N ->
            run counter(values[idx], idx);
            idx++;
        :: else ->
            break
        od
    }
}


ltl maximum_counter {[] ! ( (finished[0] && finished[1] && finished[2]) && (global_counter < 2) ) }