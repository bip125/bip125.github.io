void compute_statistics(Dataset *ds, Statistics *stats) {
    if (ds->count == 0) return;

    double *bitrates = (double*)malloc(sizeof(double) * ds->count);
    double sum = 0, min = ds->data[0].bitrate, max = ds->data[0].bitrate;

    for (int i = 0; i < ds->count; i++) {
        double br = ds->data[i].bitrate;
        bitrates[i] = br;
        sum += br;
        if (br < min) min = br;
        if (br > max) max = br;
    }

    double avg = sum / ds->count;
    sort_doubles(bitrates, ds->count);
    stats->max = max; stats->min = min; stats->avg = avg;
    stats->median = calculate_percentile(bitrates, ds->count, 50);
}