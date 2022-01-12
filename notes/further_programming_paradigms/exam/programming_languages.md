# Programming Languages

C++

Haskel

Prolog 





## C++

Header files -> https://docs.microsoft.com/en-us/cpp/cpp/header-files-cpp?view=msvc-170





project.h

```c++
namespace N{
  
  class Project{
    private:
    	char* get_hello_world_string();
    public:
			void output(char* string);
  }
}
```

project.cpp

```c++
#include "header.h"

using namespace N;

char* Project::get_hello_world_string()
{
	return "Hello world!";  
}

void Project::output(char* string)
{
  std::cout << string;
}
```

```c++
#include "header.h"

using namespace N;

void output(char *string) {
    std::cout << string;
}

int main() {
    
    Project project;
  	char* string = project.get_hello_world_string();
  	project.output(string);
   
    return 0;
  
}
```



```c++
#include <iostream>
#include <math.h>
// function to add the elements of two arrays
void add(int n, float *x, float *y)
{
  for (int i = 0; i < n; i++)
      y[i] = x[i] + y[i];
}
int main(void)
{
  int N = 1<<20; // 1M elements
  float *x = new float[N];
  float *y = new float[N];
  // initialize x and y arrays on the host
  for (int i = 0; i < N; i++) {
    x[i] = 1.0f;
    y[i] = 2.0f;
  }
  // Run kernel on 1M elements on the CPU
  add(N, x, y);
  // Check for errors (all values should be 3.0f)
  float maxError = 0.0f;
  for (int i = 0; i < N; i++) {
    maxError = fmax(maxError, fabs(y[i]-3.0f));
  }
  std::cout << "Max error: " << maxError << std::endl;
  // Free memory
  delete [] x;
  delete [] y;
  return 0; 
}
```

## Haskel



Writing hello world

```haskell
hello_world_string :: [Char]
hello_world_string = "Hello world"

-- Other way to do this is
-- hello_world_stirng = "Hello world" :: [Char]

mult6 :: Int -> Int
mult6 x = x * 6

hello_world :: IO()
hello_world = do
	print(hello_world_string)
	print(mult6 4)
	

```



Output

```bash
"Hello world"
24
```





## Prolog



