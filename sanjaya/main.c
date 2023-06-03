#include <stdio.h> 

struct task{
    void *caller, *context;
    void* data;
    void(*worker)(struct task*);
};

void task_start(struct task* ptr, int num, int db1, int db2, int fl, int ff, int abd, int abc){
    ptr->worker(ptr);
    printf("%d%d%d%d%d%d%d", num, db1, db2, fl, ff, abd, abc);
}
void worker1(struct task* ptr);

int main()
{
    size_t s = sizeof(struct task);
    struct task task = {NULL, NULL, NULL, worker1};
    task_start(&task, 3, 1, 2, 3, 10, 20, 50);
    return 0;
}