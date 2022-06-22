import 'package:supabase/supabase.dart';

final db = SupabaseClient('https://mbzybbctndstarkrbols.supabase.co',
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im1ienliYmN0bmRzdGFya3Jib2xzIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY1NTgwNDczMywiZXhwIjoxOTcxMzgwNzMzfQ._HQcCzEy1LZWkguH-88clGk23hjoFD8I-6nXwVOQNBg');

const defaultHeader = {
  'Application': 'application/json',
  'Content-Type': 'application/json',
};

const baseUrl = '/api/v1';
