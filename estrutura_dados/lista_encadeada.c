#include <stdio.h>
#include <stdlib.h>

#define TAM 5

typedef struct{
    int id;
    int *elementos;
} Lista; 

Lista* criarLista(){
    Lista *nova = (Lista*)malloc(sizeof(Lista));

    if(nova == NULL){
        printf("Sem espaço.\n");
        return NULL;
    }

    nova->id = 0;
    nova->elementos = (int*)malloc(sizeof(int) * TAM);

    if(nova->elementos == NULL){
        printf("Sem espaço.\n");
        free(nova);
        return NULL;
    }
    return nova;
}


int inserirElemento(Lista *lista, int valor){
    if(lista == NULL){
        printf("A lista não foi criada.\n");
        return 0;
    }

    if(lista->id >= TAM){
        printf("Sem esaço\n");
        return 0;
    } 

    lista->elementos[lista->id] = valor;
    ++(lista->id);
    return 1;
}


void imprimirLista(Lista *lista){
    if(lista==NULL){
        printf("A lista não foi criada.\n");
        return;
    }

    if(lista->id==0){
        printf("A lista está vazia.\n");
        return;
    }

    for(int i=0; i<lista->id;++i){
        printf("%d ",lista->elementos[i]);
    }
    printf("\n");
}


int buscarElemento(Lista *lista, int busca){
    if(lista==NULL){
        printf("A lista não foi criada.\n");
        return;
    }

    if(lista->id==0){
        printf("A lista está vazia.\n");
        return;
    }

    for(int i=0; i<lista->id;++i){
        if(lista->elementos[i] == busca){
            return i;
        }
    }

    return -1;
}

//REMOVER ELEMENTO

int main(){
    Lista *lista = NULL;
    lista = criarLista();

    imprimirLista(lista);
    inserirElemento(lista, 9);
    imprimirLista(lista);
    inserirElemento(lista, 3);
    imprimirLista(lista);

    int busca = buscarElemento(lista, 9);

    // if(busca =! 0){
    //     printf()
    // }

    return 0;
}