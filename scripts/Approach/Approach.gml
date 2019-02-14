/// @description  Approach(start, end, shift);
/// @function  Approach
/// @param start
/// @param  end
/// @param  shift

if(argument2<0){
	show_error("Impossible Approach Rate",true);
}
if (argument0 < argument1)
    return min(argument0 + argument2, argument1); 
else
    return max(argument0 - argument2, argument1);
