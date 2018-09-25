---
title: TypeScript - How To Create Object from import
tags: [nodejs,typescript,howto]
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

