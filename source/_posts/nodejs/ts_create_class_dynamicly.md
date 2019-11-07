---
title: TypeScript - How To Create Object from import
categories: nodejs
tags: [nodejs,typescript,howto]
date: 2018-09-25 18:11:39
---

## class loader

```typescript
// class file
class DynamicLoader(){
    private command{[index:string]: IDynamicClass} = {};

    public load(classFile: string){
        const dynamicClass = await import(classFile);
        Object.keys(dynamicClass).map(function(value: string, index: number, array) {
            this.commands[index] = Object.create(array[value].prototype);
        })
    }
}
```

## interface
```typescript
export interface IDynamicClass{
    execute(data:string):boolean;
};
```

## classFile
```typescript
export class dynamicClass{
    execute(data:string):boolean{
        console.log(data);
        return true;
    }
}

```

