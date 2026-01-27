#ifndef CUDA_TYPE_FIX_H
#define CUDA_TYPE_FIX_H

// Add missing type conversion functions for newer CUDA versions
__device__ __forceinline__ int float_as_int(float val)
{
    union
    {
        float f;
        int i;
    } converter;
    converter.f = val;
    return converter.i;
}

__device__ __forceinline__ float int_as_float(int val)
{
    union
    {
        int i;
        float f;
    } converter;
    converter.i = val;
    return converter.f;
}

__device__ __forceinline__ float int2float(int val) { return __int2float_rn(val); }

#endif // CUDA_TYPE_FIX_H
