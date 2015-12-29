#include "Srb.h"
#include "stm8s.h"

inline int32 Add_S32S32_S32(int32 X32, int32 Y32)
{
    int32 _res32;
    //if both numbers are positive
    if((X32 >= 0) && (Y32 >= 0))
    {
      //overflow case
      if(X32 > (S32_MAX - Y32))
      {
              _res32 = S32_MAX;
      }
      //normal case
      else
      {
              _res32 = X32 + Y32;
      }
    }
    //if both numbers are negative
    else if((X32 < 0)&&(Y32 <0))
    {
      //overflow case
      if(X32 < (S32_MIN_EDITED  - Y32))
      {
              _res32 = S32_MIN_EDITED ;
      }
      //normal case
      else
      {
              _res32 = X32 + Y32;
      }
    }
    //other cases
    else
    {
            _res32 = X32 + Y32;
    }
    
    return _res32;
}

inline int32 Subt_S32S32_S32(int32 X32, int32 Y32)
{
    int32 _res32;
    //if one number is positive, one is negative, =0 handle when 0-Min = max
    if((X32 >= 0) && (Y32 <0))
    {
      //overflow case
      if(X32 > (S32_MAX + Y32))
      {
              _res32 = S32_MAX;
      }
      //normal case
      else
      {
              _res32 = X32 - Y32;
      }
    }
    //if one number is positive, one is negative
    else if((X32 < 0)&&(Y32 >0))
    {
      //overflow case
      if(X32 < (S32_MIN_EDITED  + Y32))
      {
              _res32 = S32_MIN_EDITED ;
      }
      //normal case
      else
      {
              _res32 = X32 - Y32;
      }
    }
    //other cases
    else
    {
            _res32 = X32 - Y32;
    }
    
    return _res32;
}

inline int32 Mul_S32S32_S32(int32 X32, int32 Y32)
{
	int32 _res32;
	//one equals to 0
	if((X32==0)||(Y32==0))
	{
		_res32=0;
	}
	//two numbers have difference sign
	else if(((X32 >0)&&(Y32<0))||((X32<0)&&(Y32>0)))
	{
		if(X32>0)
		{
			if(X32 >= (S32_MIN_EDITED /Y32))
			{
				_res32 = S32_MIN_EDITED ;
			}
			else
			{
				_res32 = X32*Y32;
			}
		}
		else
		{
			if(X32 <= (S32_MIN_EDITED /Y32))
			{
				_res32 = S32_MIN_EDITED ;
			}
			else
			{
				_res32 = X32*Y32;
			}
		}
	}
	//two numbers have same sign
	else
	{
		if(X32>0)
		{
			if(X32 >= (S32_MAX /Y32))
			{
				_res32 = S32_MAX ;
			}
			else
			{
				_res32 = X32*Y32;
			}
		}
		else
		{
			if(X32 <= (S32_MAX /Y32))
			{
				_res32 = S32_MAX ;
			}
			else
			{
				_res32 = X32*Y32;
			}
		}
	}
	return _res32;
}