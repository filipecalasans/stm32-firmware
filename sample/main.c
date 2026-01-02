
void swap(int *a, int *b) {
    int aux = *a;
    *a = *b;
    *b = aux;
}

#define SIZE 10
static int array[SIZE] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};

int main() {
    int i = 0;
    while(1){
        swap(&array[i], &array[i+1]);
        i = (i + 1) % (SIZE - 1);
    }
    return 0;
}
