/*
        solution can be derived running the code with spin and 
        tracing the error which is the solution,
        the houses are indexed column wise i.e firs column index are from 1 to 6
        and the second column indexes are from 7 to 12 and so on,
               

*/
int board[49] = 0;
int cur_pos = 22;
int visited_order[11];
bool terminate;

int visited_index = 1;
init{
    terminate = false;
    visited_order[1] = 1;
    board[22] = 1;
    board[19] = 2;
    board[3] = 3;
    board[9] = 4;
    board[14] = 5;
    board[34] = 6;
    board[40] = 7;
    board[27] = 8;
    board[10] = 9;
    board[12] = 10;
    board[11] = 11;


    do
    :: (!terminate && cur_pos % 6 != 0 && board[cur_pos + 1] == 0) -> d_step { 
            board[cur_pos + 1] = 1;
            cur_pos = cur_pos + 1;
            printf("moved up which was empty, current position: %d\n", cur_pos); }
    
    :: (!terminate && cur_pos % 6 != 0 && board[cur_pos + 1] == visited_index + 1) -> d_step {            
            board[cur_pos + 1] = 1;
            cur_pos = cur_pos + 1;
            visited_index = visited_index + 1;
            printf("moved up which contained the next number, current position: %d\n", cur_pos); }

    :: (!terminate && cur_pos > 6 && board[cur_pos - 6] == 0) -> d_step {            
            board[cur_pos - 6] = 1;
            cur_pos = cur_pos - 6;
            printf("moved left which was empty, current position: %d\n", cur_pos); }

    :: (!terminate && cur_pos > 6 && board[cur_pos - 6] == visited_index + 1) -> d_step {            
            board[cur_pos - 6] = 1;
            cur_pos = cur_pos - 6;
            visited_index = visited_index + 1;
            printf("moved left which contained the next number, current position: %d\n", cur_pos); }

    :: (!terminate && cur_pos < 43 && board[cur_pos + 6] == 0) -> d_step {            
            board[cur_pos + 6] = 1;
            cur_pos = cur_pos + 6;
            printf("moved right which was empty, current position: %d\n", cur_pos); }

    :: (!terminate && cur_pos < 43 && board[cur_pos + 6] == visited_index + 1) -> d_step {            
            board[cur_pos + 6] = 1;
            cur_pos = cur_pos + 6;
            visited_index = visited_index + 1;
            printf("moved right which contained next number, current position: %d\n", cur_pos); }

    :: (!terminate && cur_pos % 6 != 1 && board[cur_pos - 1] == 0) -> d_step {            
            board[cur_pos - 1] = 1;
            cur_pos = cur_pos - 1;
            printf("moved down which was empty, current position: %d\n", cur_pos); }

    :: (!terminate && cur_pos % 6 != 1 && board[cur_pos - 1] == visited_index + 1) -> d_step {            
            board[cur_pos - 1] = 1;
            cur_pos = cur_pos - 1;
            visited_index = visited_index + 1;
            printf("moved down which was empty, current position: %d\n", cur_pos); }

    :: ( (cur_pos % 6 == 0 || (cur_pos % 6 != 0 && (board[cur_pos + 1] == 1 || board[cur_pos + 1] != visited_index + 1))) && 
         (cur_pos <= 6 || (cur_pos > 6 && (board[cur_pos - 6] == 1 || board[cur_pos - 6] != visited_index + 1))) && 
         (cur_pos > 42 || (cur_pos <= 42 && (board[cur_pos + 6] == 1 || board[cur_pos + 6] != visited_index + 1))) &&
         (cur_pos % 6 == 1 || (cur_pos % 6 != 1 && (board[cur_pos - 1] == 1 || board[cur_pos - 1] != visited_index + 1)))) -> d_step {

            terminate = true;
            printf("terminated");
         }
    
    
    od

}


ltl no_solution {! ((!terminate) U (visited_index == 11))}