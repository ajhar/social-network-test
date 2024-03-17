<?php

namespace App\Helpers\Traits;

trait GeneralDatabaseOperation
{
    public static function findById($id)
    {
        return self::findBy(['id' => $id]);
    }

    public static function findBy($whereCondition)
    {
        return self::where($whereCondition)->first();
    }

    public static function selectBy($whereCondition)
    {
        return self::where($whereCondition)->get();
    }

    public static function selectFirstEntry($whereCondition = [], $columns = [])
    {
        $rows = self::where($whereCondition);

        if (!empty($columns)) {
            $rows = $rows->select($columns);
        }

        return $rows->first();
    }

    public static function deleteById($id)
    {
        self::deleteBy(['id' => $id]);
    }

    public static function deleteBy($whereCondition)
    {
        self::where($whereCondition)->delete();
    }

    public static function updateById($id, $values)
    {
        self::updateBy(['id' => $id], $values);
    }

    public static function updateBy($whereCondition, $values)
    {
        self::where($whereCondition)->update($values);
    }

    public static function getAll()
    {
        return self::get();
    }

    public static function getCount($condition = [])
    {
        return self::where($condition)
            ->count();
    }

    public static function isExists($condition)
    {
        return self::where($condition)
            ->exists();
    }
}
