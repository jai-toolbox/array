// equal values must be adjacent; leaves the input unchanged and keeps the first.
// the caller owns the returned array, which allocates only enough room for unique values.
copy_sorted_array_without_duplicates :: (
    array: [] $T,
    $equal: (T, T) -> bool = values_are_equal,
) -> [..] T {
    unique_count := 0;
    for value, index: array {
        if index == 0 || !equal(value, array[index - 1]) unique_count += 1;
    }

    result: [..] T;
    array_resize(*result, unique_count);
    destination_index := 0;
    for value, index: array {
        if index == 0 || !equal(value, array[index - 1]) {
            result[destination_index] = value;
            destination_index += 1;
        }
    }
    return result;
}

#scope_file

#import "Basic";

values_are_equal :: (a: $T, b: T) -> bool {
    return a == b;
}
