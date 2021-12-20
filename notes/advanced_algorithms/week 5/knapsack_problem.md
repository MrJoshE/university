### Knapsack Problem

##### Knapsack Problem

- Given n items and a 'knapsack'
- Item i has weight $w_i$ > 0 kilograms and value $v_i$ > 0.
- Knapsack has max capacity of W kilograms.
- Goal: fill knapsack so as to maximuse total value.

```ts
var arr= [];
function KS(n,c){
  if(arr[n][c]) == undefined) return arr[n][c];
  // Base case
  if (n == 0 || c==0){
  	result = 0;    
  } else if (w[n] > c){
    result = KS(n-1,c)
  }else{
    let tmp1 = KS(n-1,c)
    let tmp2 = KS(n-1,c-w[n])
    result = max(tmp1, tmp2)
  }
  
  arr[n][c] = result
  return result
}
```



